defmodule RansomNote do

	def can_construct(note, magazine) do
		magazine_frequencies = get_frequencies(magazine)
		note_characters = String.graphemes(note)
		can_construct_helper(magazine_frequencies, note_characters)
	end

	defp can_construct_helper(_magazine_frequencies, []), do: true

	defp can_construct_helper(magazine_frequencies, [ character | characters]) do
		count = Map.get(magazine_frequencies, character)
		if is_nil(count) or count === 0   do
			false
		else
			magazine_frequencies
			|> Map.update!(character, &(&1 - 1))
			|> can_construct_helper(characters)
		end
	end

	defp get_frequencies(a_string) do
		a_string
		|> String.graphemes()
		|> Enum.reduce(%{}, fn grapheme, frequencies ->  
			Map.update(frequencies, grapheme, 1, &(&1 + 1))
		end)
	end
end

IO.inspect RansomNote.can_construct("a", "b")
IO.inspect RansomNote.can_construct("aa", "ab")
IO.inspect RansomNote.can_construct("aa", "aab")
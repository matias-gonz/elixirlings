defmodule RPGPoints do
    def points_spent({strength, dexterity, intelligence}) do
        strength * 2 + dexterity * 3 + intelligence * 3
    end
end

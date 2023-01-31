defmodule TicTacToe do
    def winner({w, w, w, _, _, _, _, _, _}) do
        {:winner, w}
    end
    def winner({_, _, _, w, w, w, _, _, _}) do
        {:winner, w}
    end
    def winner({_, _, _, _, _, _, w, w, w}) do
        {:winner, w}
    end
    def winner({w, _, _, w, _, _, w, _, _}) do
        {:winner, w}
    end
    def winner({_, w, _, _, w, _, _, w, _}) do
        {:winner, w}
    end
    def winner({_, _, w, _, _, w, _, _, w}) do
        {:winner, w}
    end
    def winner({w, _, _, _, w, _, _, _, w}) do
        {:winner, w}
    end
    def winner({_, _, w, _, w, _, w, _, _}) do
        {:winner, w}
    end
    def winner(_) do
      :no_winner
    end
end

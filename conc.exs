defmodule MyModule do
  def loop(0, _), do: nil
  def loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Number: #{max}"
      loop(max-1, min)
    end
  end

  def main do
    count()
  end

  def count do
    spawn(fn() -> loop(10,1) end)
    spawn(fn() -> loop(20,10) end)
    send(self(), {:french, "Bob"})

  end

  receive do
    {:french, name} -> IO.puts "Bonjour, #{name}"
    #{:english, name} -> IO.puts "Hello, #{name}"
    #IO.puts -> "s"

  after
    500 -> IO.puts "Time's up"
  end

end

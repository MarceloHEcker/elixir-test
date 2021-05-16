defmodule Inmana.Welcomer do
  # Receber um nome e uma idade do usuario
  # Se o usuário chamar "banana" e tiver idade "42", ele recebe uma mensagem especial
  # Se o usuário for maior de idade, ele recebe uma mensagem normal
  # Se o usuário for menor de idade, retornamos um erro
  # Temos que tratar o nome do usuário para entradas erradas, como "BaNaNa", "Banana \n"

  def welcome(%{"name" => name, "age" => age}) do
    age = age |> String.to_integer()

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special"}
  end

  # when = guard --- adiciona mais funcionalidades ao pattern match
  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end

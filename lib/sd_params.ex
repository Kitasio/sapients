defmodule SDParams do
  @derive Jason.Encoder
  defstruct [
      prompt: "Magnificent house",
      width: 512,
      height: 512,
      num_outputs: 1,
  ]
end

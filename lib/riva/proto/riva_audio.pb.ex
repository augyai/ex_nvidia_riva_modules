defmodule Nvidia.Riva.AudioEncoding do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :ENCODING_UNSPECIFIED, 0
  field :LINEAR_PCM, 1
  field :FLAC, 2
  field :MULAW, 3
  field :OGGOPUS, 4
  field :ALAW, 20
end
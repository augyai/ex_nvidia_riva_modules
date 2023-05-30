defmodule Nvidia.Riva.Tts.RivaSynthesisConfigRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_name, 1, type: :string, json_name: "modelName"
end

defmodule Nvidia.Riva.Tts.RivaSynthesisConfigResponse.Config.ParametersEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Nvidia.Riva.Tts.RivaSynthesisConfigResponse.Config do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_name, 1, type: :string, json_name: "modelName"

  field :parameters, 2,
    repeated: true,
    type: Nvidia.Riva.Tts.RivaSynthesisConfigResponse.Config.ParametersEntry,
    map: true
end

defmodule Nvidia.Riva.Tts.RivaSynthesisConfigResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_config, 1,
    repeated: true,
    type: Nvidia.Riva.Tts.RivaSynthesisConfigResponse.Config,
    json_name: "modelConfig"
end

defmodule Nvidia.Riva.Tts.SynthesizeSpeechRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :text, 1, type: :string
  field :language_code, 2, type: :string, json_name: "languageCode"
  field :encoding, 3, type: Nvidia.Riva.AudioEncoding, enum: true
  field :sample_rate_hz, 4, type: :int32, json_name: "sampleRateHz"
  field :voice_name, 5, type: :string, json_name: "voiceName"
end

defmodule Nvidia.Riva.Tts.SynthesizeSpeechResponseMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :text, 1, type: :string
  field :processed_text, 2, type: :string, json_name: "processedText"
  field :predicted_durations, 8, repeated: true, type: :float, json_name: "predictedDurations"
end

defmodule Nvidia.Riva.Tts.SynthesizeSpeechResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :audio, 1, type: :bytes
  field :meta, 2, type: Nvidia.Riva.Tts.SynthesizeSpeechResponseMetadata
end

defmodule Nvidia.Riva.Tts.RivaSpeechSynthesis.Service do
  @moduledoc false

  use GRPC.Service,
    name: "nvidia.riva.tts.RivaSpeechSynthesis",
    protoc_gen_elixir_version: "0.12.0"

  rpc :Synthesize,
      Nvidia.Riva.Tts.SynthesizeSpeechRequest,
      Nvidia.Riva.Tts.SynthesizeSpeechResponse

  rpc :SynthesizeOnline,
      Nvidia.Riva.Tts.SynthesizeSpeechRequest,
      stream(Nvidia.Riva.Tts.SynthesizeSpeechResponse)

  rpc :GetRivaSynthesisConfig,
      Nvidia.Riva.Tts.RivaSynthesisConfigRequest,
      Nvidia.Riva.Tts.RivaSynthesisConfigResponse
end

defmodule Nvidia.Riva.Tts.RivaSpeechSynthesis.Stub do
  @moduledoc false

  use GRPC.Stub, service: Nvidia.Riva.Tts.RivaSpeechSynthesis.Service
end
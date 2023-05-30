defmodule Nvidia.Riva.Asr.RivaSpeechRecognitionConfigRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_name, 1, type: :string, json_name: "modelName"
end

defmodule Nvidia.Riva.Asr.RivaSpeechRecognitionConfigResponse.Config.ParametersEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Nvidia.Riva.Asr.RivaSpeechRecognitionConfigResponse.Config do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_name, 1, type: :string, json_name: "modelName"

  field :parameters, 2,
    repeated: true,
    type: Nvidia.Riva.Asr.RivaSpeechRecognitionConfigResponse.Config.ParametersEntry,
    map: true
end

defmodule Nvidia.Riva.Asr.RivaSpeechRecognitionConfigResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_config, 1,
    repeated: true,
    type: Nvidia.Riva.Asr.RivaSpeechRecognitionConfigResponse.Config,
    json_name: "modelConfig"
end

defmodule Nvidia.Riva.Asr.RecognizeRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :config, 1, type: Nvidia.Riva.Asr.RecognitionConfig
  field :audio, 2, type: :bytes
end

defmodule Nvidia.Riva.Asr.StreamingRecognizeRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :streaming_request, 0

  field :streaming_config, 1,
    type: Nvidia.Riva.Asr.StreamingRecognitionConfig,
    json_name: "streamingConfig",
    oneof: 0

  field :audio_content, 2, type: :bytes, json_name: "audioContent", oneof: 0
end

defmodule Nvidia.Riva.Asr.RecognitionConfig.CustomConfigurationEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Nvidia.Riva.Asr.RecognitionConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :encoding, 1, type: Nvidia.Riva.AudioEncoding, enum: true
  field :sample_rate_hertz, 2, type: :int32, json_name: "sampleRateHertz"
  field :language_code, 3, type: :string, json_name: "languageCode"
  field :max_alternatives, 4, type: :int32, json_name: "maxAlternatives"
  field :profanity_filter, 5, type: :bool, json_name: "profanityFilter"

  field :speech_contexts, 6,
    repeated: true,
    type: Nvidia.Riva.Asr.SpeechContext,
    json_name: "speechContexts"

  field :audio_channel_count, 7, type: :int32, json_name: "audioChannelCount"
  field :enable_word_time_offsets, 8, type: :bool, json_name: "enableWordTimeOffsets"
  field :enable_automatic_punctuation, 11, type: :bool, json_name: "enableAutomaticPunctuation"

  field :enable_separate_recognition_per_channel, 12,
    type: :bool,
    json_name: "enableSeparateRecognitionPerChannel"

  field :model, 13, type: :string
  field :verbatim_transcripts, 14, type: :bool, json_name: "verbatimTranscripts"

  field :diarization_config, 19,
    type: Nvidia.Riva.Asr.SpeakerDiarizationConfig,
    json_name: "diarizationConfig"

  field :custom_configuration, 24,
    repeated: true,
    type: Nvidia.Riva.Asr.RecognitionConfig.CustomConfigurationEntry,
    json_name: "customConfiguration",
    map: true
end

defmodule Nvidia.Riva.Asr.StreamingRecognitionConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :config, 1, type: Nvidia.Riva.Asr.RecognitionConfig
  field :interim_results, 2, type: :bool, json_name: "interimResults"
end

defmodule Nvidia.Riva.Asr.SpeakerDiarizationConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :enable_speaker_diarization, 1, type: :bool, json_name: "enableSpeakerDiarization"
  field :max_speaker_count, 2, type: :int32, json_name: "maxSpeakerCount"
end

defmodule Nvidia.Riva.Asr.SpeechContext do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :phrases, 1, repeated: true, type: :string
  field :boost, 4, type: :float
end

defmodule Nvidia.Riva.Asr.RecognizeResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :results, 1, repeated: true, type: Nvidia.Riva.Asr.SpeechRecognitionResult
end

defmodule Nvidia.Riva.Asr.SpeechRecognitionResult do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :alternatives, 1, repeated: true, type: Nvidia.Riva.Asr.SpeechRecognitionAlternative
  field :channel_tag, 2, type: :int32, json_name: "channelTag"
  field :audio_processed, 3, type: :float, json_name: "audioProcessed"
end

defmodule Nvidia.Riva.Asr.SpeechRecognitionAlternative do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :transcript, 1, type: :string
  field :confidence, 2, type: :float
  field :words, 3, repeated: true, type: Nvidia.Riva.Asr.WordInfo
end

defmodule Nvidia.Riva.Asr.WordInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :start_time, 1, type: :int32, json_name: "startTime"
  field :end_time, 2, type: :int32, json_name: "endTime"
  field :word, 3, type: :string
  field :confidence, 4, type: :float
  field :speaker_tag, 5, type: :int32, json_name: "speakerTag"
end

defmodule Nvidia.Riva.Asr.StreamingRecognizeResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :results, 1, repeated: true, type: Nvidia.Riva.Asr.StreamingRecognitionResult
end

defmodule Nvidia.Riva.Asr.StreamingRecognitionResult do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :alternatives, 1, repeated: true, type: Nvidia.Riva.Asr.SpeechRecognitionAlternative
  field :is_final, 2, type: :bool, json_name: "isFinal"
  field :stability, 3, type: :float
  field :channel_tag, 5, type: :int32, json_name: "channelTag"
  field :audio_processed, 6, type: :float, json_name: "audioProcessed"
end

defmodule Nvidia.Riva.Asr.RivaSpeechRecognition.Service do
  @moduledoc false

  use GRPC.Service,
    name: "nvidia.riva.asr.RivaSpeechRecognition",
    protoc_gen_elixir_version: "0.12.0"

  rpc :Recognize, Nvidia.Riva.Asr.RecognizeRequest, Nvidia.Riva.Asr.RecognizeResponse

  rpc :StreamingRecognize,
      stream(Nvidia.Riva.Asr.StreamingRecognizeRequest),
      stream(Nvidia.Riva.Asr.StreamingRecognizeResponse)

  rpc :GetRivaSpeechRecognitionConfig,
      Nvidia.Riva.Asr.RivaSpeechRecognitionConfigRequest,
      Nvidia.Riva.Asr.RivaSpeechRecognitionConfigResponse
end

defmodule Nvidia.Riva.Asr.RivaSpeechRecognition.Stub do
  @moduledoc false

  use GRPC.Stub, service: Nvidia.Riva.Asr.RivaSpeechRecognition.Service
end
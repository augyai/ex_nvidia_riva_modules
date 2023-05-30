defmodule Nvidia.Riva.Nmt.StreamingTranslateSpeechToSpeechConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :asr_config, 1, type: Nvidia.Riva.Asr.StreamingRecognitionConfig, json_name: "asrConfig"
  field :tts_config, 2, type: Nvidia.Riva.Nmt.SynthesizeSpeechConfig, json_name: "ttsConfig"

  field :translation_config, 3,
    type: Nvidia.Riva.Nmt.TranslationConfig,
    json_name: "translationConfig"
end

defmodule Nvidia.Riva.Nmt.StreamingTranslateSpeechToSpeechRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :streaming_request, 0

  field :config, 1, type: Nvidia.Riva.Nmt.StreamingTranslateSpeechToSpeechConfig, oneof: 0
  field :audio_content, 2, type: :bytes, json_name: "audioContent", oneof: 0
end

defmodule Nvidia.Riva.Nmt.TranslationConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :source_language_code, 1, type: :string, json_name: "sourceLanguageCode"
  field :target_language_code, 2, type: :string, json_name: "targetLanguageCode"
  field :model_name, 3, type: :string, json_name: "modelName"
end

defmodule Nvidia.Riva.Nmt.SynthesizeSpeechConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :encoding, 1, type: Nvidia.Riva.AudioEncoding, enum: true
  field :sample_rate_hz, 2, type: :int32, json_name: "sampleRateHz"
  field :voice_name, 3, type: :string, json_name: "voiceName"
  field :language_code, 4, type: :string, json_name: "languageCode"
end

defmodule Nvidia.Riva.Nmt.StreamingTranslateSpeechToSpeechResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :speech, 1, type: Nvidia.Riva.Tts.SynthesizeSpeechResponse
end

defmodule Nvidia.Riva.Nmt.StreamingTranslateSpeechToTextRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :streaming_request, 0

  field :config, 1, type: Nvidia.Riva.Nmt.StreamingTranslateSpeechToTextConfig, oneof: 0
  field :audio_content, 2, type: :bytes, json_name: "audioContent", oneof: 0
end

defmodule Nvidia.Riva.Nmt.StreamingTranslateSpeechToTextResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :results, 1, repeated: true, type: Nvidia.Riva.Asr.StreamingRecognitionResult
end

defmodule Nvidia.Riva.Nmt.StreamingTranslateSpeechToTextConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :asr_config, 1, type: Nvidia.Riva.Asr.StreamingRecognitionConfig, json_name: "asrConfig"

  field :translation_config, 2,
    type: Nvidia.Riva.Nmt.TranslationConfig,
    json_name: "translationConfig"
end

defmodule Nvidia.Riva.Nmt.TranslateTextRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :texts, 1, repeated: true, type: :string
  field :model, 2, type: :string
  field :source_language, 3, type: :string, json_name: "sourceLanguage"
  field :target_language, 4, type: :string, json_name: "targetLanguage"
end

defmodule Nvidia.Riva.Nmt.Translation do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :text, 1, type: :string
  field :language, 2, type: :string
end

defmodule Nvidia.Riva.Nmt.TranslateTextResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :translations, 1, repeated: true, type: Nvidia.Riva.Nmt.Translation
end

defmodule Nvidia.Riva.Nmt.AvailableLanguageRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model, 1, type: :string
end

defmodule Nvidia.Riva.Nmt.AvailableLanguageResponse.LanguagePair do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :src_lang, 1, repeated: true, type: :string, json_name: "srcLang"
  field :tgt_lang, 2, repeated: true, type: :string, json_name: "tgtLang"
end

defmodule Nvidia.Riva.Nmt.AvailableLanguageResponse.LanguagesEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Nvidia.Riva.Nmt.AvailableLanguageResponse.LanguagePair
end

defmodule Nvidia.Riva.Nmt.AvailableLanguageResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :languages, 1,
    repeated: true,
    type: Nvidia.Riva.Nmt.AvailableLanguageResponse.LanguagesEntry,
    map: true
end

defmodule Nvidia.Riva.Nmt.RivaTranslation.Service do
  @moduledoc false

  use GRPC.Service, name: "nvidia.riva.nmt.RivaTranslation", protoc_gen_elixir_version: "0.12.0"

  rpc :TranslateText, Nvidia.Riva.Nmt.TranslateTextRequest, Nvidia.Riva.Nmt.TranslateTextResponse

  rpc :ListSupportedLanguagePairs,
      Nvidia.Riva.Nmt.AvailableLanguageRequest,
      Nvidia.Riva.Nmt.AvailableLanguageResponse

  rpc :StreamingTranslateSpeechToText,
      stream(Nvidia.Riva.Nmt.StreamingTranslateSpeechToTextRequest),
      stream(Nvidia.Riva.Nmt.StreamingTranslateSpeechToTextResponse)

  rpc :StreamingTranslateSpeechToSpeech,
      stream(Nvidia.Riva.Nmt.StreamingTranslateSpeechToSpeechRequest),
      stream(Nvidia.Riva.Nmt.StreamingTranslateSpeechToSpeechResponse)
end

defmodule Nvidia.Riva.Nmt.RivaTranslation.Stub do
  @moduledoc false

  use GRPC.Stub, service: Nvidia.Riva.Nmt.RivaTranslation.Service
end
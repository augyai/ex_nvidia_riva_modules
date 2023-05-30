defmodule Nvidia.Riva.Nlp.RivaNLPConfigRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_name, 1, type: :string, json_name: "modelName"
end

defmodule Nvidia.Riva.Nlp.RivaNLPConfigResponse.Config.ParametersEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Nvidia.Riva.Nlp.RivaNLPConfigResponse.Config do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_name, 1, type: :string, json_name: "modelName"

  field :parameters, 2,
    repeated: true,
    type: Nvidia.Riva.Nlp.RivaNLPConfigResponse.Config.ParametersEntry,
    map: true
end

defmodule Nvidia.Riva.Nlp.RivaNLPConfigResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_config, 1,
    repeated: true,
    type: Nvidia.Riva.Nlp.RivaNLPConfigResponse.Config,
    json_name: "modelConfig"
end

defmodule Nvidia.Riva.Nlp.NLPModelParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :model_name, 1, type: :string, json_name: "modelName"
  field :language_code, 3, type: :string, json_name: "languageCode"
end

defmodule Nvidia.Riva.Nlp.TextTransformRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :text, 1, repeated: true, type: :string
  field :top_n, 2, type: :uint32, json_name: "topN"
  field :model, 3, type: Nvidia.Riva.Nlp.NLPModelParams
end

defmodule Nvidia.Riva.Nlp.TextTransformResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :text, 1, repeated: true, type: :string
end

defmodule Nvidia.Riva.Nlp.TextClassRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :text, 1, repeated: true, type: :string
  field :top_n, 2, type: :uint32, json_name: "topN"
  field :model, 3, type: Nvidia.Riva.Nlp.NLPModelParams
end

defmodule Nvidia.Riva.Nlp.Classification do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :class_name, 1, type: :string, json_name: "className"
  field :score, 2, type: :float
end

defmodule Nvidia.Riva.Nlp.Span do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :start, 1, type: :uint32
  field :end, 2, type: :uint32
end

defmodule Nvidia.Riva.Nlp.ClassificationResult do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :labels, 1, repeated: true, type: Nvidia.Riva.Nlp.Classification
end

defmodule Nvidia.Riva.Nlp.TextClassResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :results, 1, repeated: true, type: Nvidia.Riva.Nlp.ClassificationResult
end

defmodule Nvidia.Riva.Nlp.TokenClassRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :text, 1, repeated: true, type: :string
  field :top_n, 3, type: :uint32, json_name: "topN"
  field :model, 4, type: Nvidia.Riva.Nlp.NLPModelParams
end

defmodule Nvidia.Riva.Nlp.TokenClassValue do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :token, 1, type: :string
  field :label, 2, repeated: true, type: Nvidia.Riva.Nlp.Classification
  field :span, 3, repeated: true, type: Nvidia.Riva.Nlp.Span
end

defmodule Nvidia.Riva.Nlp.TokenClassSequence do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :results, 1, repeated: true, type: Nvidia.Riva.Nlp.TokenClassValue
end

defmodule Nvidia.Riva.Nlp.TokenClassResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :results, 1, repeated: true, type: Nvidia.Riva.Nlp.TokenClassSequence
end

defmodule Nvidia.Riva.Nlp.AnalyzeIntentContext do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Nvidia.Riva.Nlp.AnalyzeIntentOptions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :context, 0

  field :previous_intent, 1, type: :string, json_name: "previousIntent", oneof: 0
  field :vectors, 2, type: Nvidia.Riva.Nlp.AnalyzeIntentContext, oneof: 0
  field :domain, 3, type: :string
  field :lang, 4, type: :string
end

defmodule Nvidia.Riva.Nlp.AnalyzeIntentRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :query, 1, type: :string
  field :options, 2, type: Nvidia.Riva.Nlp.AnalyzeIntentOptions
end

defmodule Nvidia.Riva.Nlp.AnalyzeIntentResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :intent, 1, type: Nvidia.Riva.Nlp.Classification
  field :slots, 2, repeated: true, type: Nvidia.Riva.Nlp.TokenClassValue
  field :domain_str, 3, type: :string, json_name: "domainStr"
  field :domain, 4, type: Nvidia.Riva.Nlp.Classification
end

defmodule Nvidia.Riva.Nlp.AnalyzeEntitiesOptions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :lang, 4, type: :string
end

defmodule Nvidia.Riva.Nlp.AnalyzeEntitiesRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :query, 1, type: :string
  field :options, 2, type: Nvidia.Riva.Nlp.AnalyzeEntitiesOptions
end

defmodule Nvidia.Riva.Nlp.NaturalQueryRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :query, 1, type: :string
  field :top_n, 2, type: :uint32, json_name: "topN"
  field :context, 3, type: :string
end

defmodule Nvidia.Riva.Nlp.NaturalQueryResult do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :answer, 1, type: :string
  field :score, 2, type: :float
end

defmodule Nvidia.Riva.Nlp.NaturalQueryResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :results, 1, repeated: true, type: Nvidia.Riva.Nlp.NaturalQueryResult
end

defmodule Nvidia.Riva.Nlp.RivaLanguageUnderstanding.Service do
  @moduledoc false

  use GRPC.Service,
    name: "nvidia.riva.nlp.RivaLanguageUnderstanding",
    protoc_gen_elixir_version: "0.12.0"

  rpc :ClassifyText, Nvidia.Riva.Nlp.TextClassRequest, Nvidia.Riva.Nlp.TextClassResponse

  rpc :ClassifyTokens, Nvidia.Riva.Nlp.TokenClassRequest, Nvidia.Riva.Nlp.TokenClassResponse

  rpc :TransformText, Nvidia.Riva.Nlp.TextTransformRequest, Nvidia.Riva.Nlp.TextTransformResponse

  rpc :AnalyzeEntities, Nvidia.Riva.Nlp.AnalyzeEntitiesRequest, Nvidia.Riva.Nlp.TokenClassResponse

  rpc :AnalyzeIntent, Nvidia.Riva.Nlp.AnalyzeIntentRequest, Nvidia.Riva.Nlp.AnalyzeIntentResponse

  rpc :PunctuateText, Nvidia.Riva.Nlp.TextTransformRequest, Nvidia.Riva.Nlp.TextTransformResponse

  rpc :NaturalQuery, Nvidia.Riva.Nlp.NaturalQueryRequest, Nvidia.Riva.Nlp.NaturalQueryResponse

  rpc :GetRivaNLPConfig,
      Nvidia.Riva.Nlp.RivaNLPConfigRequest,
      Nvidia.Riva.Nlp.RivaNLPConfigResponse
end

defmodule Nvidia.Riva.Nlp.RivaLanguageUnderstanding.Stub do
  @moduledoc false

  use GRPC.Stub, service: Nvidia.Riva.Nlp.RivaLanguageUnderstanding.Service
end
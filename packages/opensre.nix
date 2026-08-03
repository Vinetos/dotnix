{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,

  # direct
  anthropic,
  mcp,
  openai,
  litellm,
  pydantic,
  pydantic-settings,
  kubernetes,
  httpx,
  aiohttp,
  fastapi,
  uvicorn,
  pyjwt,
  cryptography,
  keyring,
  boto3,
  slack-sdk,
  discord-py,
  python-dotenv,
  click,
  rich,
  questionary,
  prompt-toolkit,
  pyyaml,
  numpy,
  tzdata,
  opentelemetry-api,
  opentelemetry-sdk,
  opentelemetry-exporter-otlp-proto-http,
  opentelemetry-instrumentation,
  opentelemetry-instrumentation-botocore,
  opentelemetry-instrumentation-requests,
  tracer-decorator,
  google-api-python-client,
  google-auth,
  pymongo,
  redis,
  pynacl,
  pymysql,
  clickhouse-connect,
  sentry-sdk,
  filelock,
  psutil,
  apscheduler,

  # tests
  versionCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "opensre";
  version = "0.1.2026.7.31";
  pyproject = true;

  build-system = [
    setuptools
  ];

  src = fetchFromGitHub {
    owner = "Tracer-Cloud";
    repo = finalAttrs.pname;
    tag = finalAttrs.version;
    hash = lib.fakeHash;
  };

  dependencies = [
    anthropic
    mcp
    openai
    litellm
    pydantic
    pydantic-settings
    kubernetes
    httpx
    aiohttp
    fastapi
    uvicorn
    pyjwt
    cryptography
    keyring
    boto3
    slack-sdk
    discord-py
    python-dotenv
    click
    rich
    questionary
    prompt-toolkit
    pyyaml
    numpy
    tzdata
    opentelemetry-api
    opentelemetry-sdk
    opentelemetry-exporter-otlp-proto-http
    opentelemetry-instrumentation
    opentelemetry-instrumentation-botocore
    opentelemetry-instrumentation-requests
    tracer-decorator
    google-api-python-client
    google-auth
    pymongo
    redis
    pynacl
    pymysql
    clickhouse-connect
    sentry-sdk
    filelock
    psutil
    apscheduler
  ];

  nativeCheckInputs = [

  ];

  nativeInstallCheckInputs = [ versionCheckHook ];
  versionCheckProgram = "opensre";
  doInstallCheck = true;

  pythonImportsCheck = [
    "opensre"
  ];

  meta = {
    description = "Opensource toolkit to build your own AI SRE agents.";
    homepage = "";
    downloadPage = "https://github.com/Tracer-Cloud/opensre/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.asl20;
    teams = [ lib.teams.openstack ];
  };
})

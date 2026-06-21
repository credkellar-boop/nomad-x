from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    """
    Strict environment validation. 
    Fails fast if the business infrastructure is missing credentials.
    """
    environment: str = "production"
    api_port: int = 8000
    
    # Omni-AI Keys
    gemini_api_key: str | None = None
    openai_api_key: str | None = None
    anthropic_api_key: str | None = None
    xai_api_key: str | None = None

    # High-Frequency / Blockchain RPC
    monad_rpc_url: str = "https://rpc.monad.xyz"
    corporate_wallet_address: str | None = None

    class Config:
        env_file = ".env"

settings = Settings()

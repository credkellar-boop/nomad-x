from sqlalchemy import Column, String, Integer, Float, DateTime, Boolean
from sqlalchemy.sql import func
from src.database import Base

class TranslationAuditLog(Base):
    """
    Immutable ledger for enterprise billing and compliance.
    Records every interaction with the multi-model AI router.
    """
    __tablename__ = "translation_audit_logs"

    id = Column(String, primary_key=True, index=True)
    timestamp = Column(DateTime(timezone=True), server_default=func.now())
    corporate_id = Column(String, index=True, nullable=False)
    engine_used = Column(String, nullable=False)
    source_language = Column(String, default="auto")
    target_language = Column(String, nullable=False)
    input_tokens = Column(Integer, default=0)
    output_tokens = Column(Integer, default=0)
    latency_ms = Column(Float, nullable=False)
    cache_hit = Column(Boolean, default=False)
  

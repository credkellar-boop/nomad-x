from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import declarative_base, sessionmaker
from src.config import settings

# In a pure business environment, we use high-performance Postgres for audit trails.
# Defaulting to an in-memory SQLite for scaffolding if DB URL isn't set.
SQLALCHEMY_DATABASE_URL = os.getenv("DATABASE_URL", "sqlite+aiosqlite:///./nomad_x_audit.db")

engine = create_async_engine(
    SQLALCHEMY_DATABASE_URL, 
    echo=False,
    future=True
)

AsyncSessionLocal = sessionmaker(
    engine, class_=AsyncSession, expire_on_commit=False
)

Base = declarative_base()

async def get_db():
    async with AsyncSessionLocal() as session:
        yield session
      

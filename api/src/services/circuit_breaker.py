import time
from typing import Callable, Any
from fastapi import HTTPException

class OmniAICircuitBreaker:
    """
    Prevents cascading failures if an AI provider (e.g., OpenAI or Anthropic) 
    experiences a severe outage. Fails over immediately to maintain B2B SLAs.
    """
    def __init__(self, failure_threshold: int = 3, recovery_timeout: int = 60):
        self.failure_threshold = failure_threshold
        self.recovery_timeout = recovery_timeout
        self.failures = { "gemini": 0, "gpt4": 0, "claude": 0, "grok": 0 }
        self.last_failure_time = { "gemini": 0.0, "gpt4": 0.0, "claude": 0.0, "grok": 0.0 }

    def is_engine_available(self, engine_name: str) -> bool:
        if self.failures.get(engine_name, 0) >= self.failure_threshold:
            time_since_failure = time.time() - self.last_failure_time.get(engine_name, 0)
            if time_since_failure > self.recovery_timeout:
                # Reset after timeout for a retry
                self.failures[engine_name] = 0
                return True
            return False
        return True

    def record_failure(self, engine_name: str):
        self.failures[engine_name] = self.failures.get(engine_name, 0) + 1
        self.last_failure_time[engine_name] = time.time()

circuit_breaker = OmniAICircuitBreaker()

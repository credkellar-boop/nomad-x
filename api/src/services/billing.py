class TokenEconomicsEngine:
    """
    Calculates operational costs dynamically based on the specific 
    AI model used during the transaction lifecycle.
    """
    COST_PER_1K_TOKENS = {
        "gemini": 0.000125,
        "gpt4": 0.03,
        "claude": 0.015,
        "grok": 0.01
    }

    @classmethod
    def calculate_transaction_cost(cls, engine: str, total_tokens: int) -> float:
        rate = cls.COST_PER_1K_TOKENS.get(engine, 0.05) # Default penalty rate if unknown
        return (total_tokens / 1000.0) * rate

billing_engine = TokenEconomicsEngine()

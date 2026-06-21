import asyncio
from typing import List
from src.ai_router import router
from src.database import AsyncSessionLocal

async def process_bulk_translation_payload(payloads: List[dict], target_lang: str):
    """
    Background worker for asynchronous, high-volume batch processing.
    Frees up the main API thread while tearing through data utilizing the Omni-AI router.
    """
    async with AsyncSessionLocal() as db_session:
        tasks = []
        for item in payloads:
            # Dispatch multiple concurrent tasks across the multi-model AI logic
            task = asyncio.create_task(router.execute_task(item["text"], target_lang))
            tasks.append(task)
        
        results = await asyncio.gather(*tasks, return_exceptions=True)
        
        # In production: Write success/failures to the database audit ledger
        for idx, result in enumerate(results):
            if isinstance(result, Exception):
                print(f"[ERROR] Task {idx} failed: {str(result)}")
            else:
                print(f"[SUCCESS] Payload {idx} routed via {result['engine']}")
              

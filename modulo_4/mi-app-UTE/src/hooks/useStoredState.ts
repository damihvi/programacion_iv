import { useEffect, useRef, useState } from "react";
import { getJson, removeKey, setJson } from "@/storage/storage";

type Return<T> = {
  value: T;
  setValue: (next: T) => void;
  loading: boolean;
  reset: () => Promise<void>;
};

export function useStoredState<T>(key: string, initialValue: T): Return<T> {
  const [value, setValue] = useState<T>(initialValue);
  const [loading, setLoading] = useState<boolean>(true);

  // Evita guardar antes de terminar la carga inicial
  const hydrated = useRef<boolean>(false);

  useEffect(() => {
    let cancelled = false;

    async function hydrate() {
      try {
        const stored = await getJson<T>(key);
        if (!cancelled && stored !== null) setValue(stored);
      } finally {
        if (!cancelled) {
          setLoading(false);
          hydrated.current = true;
        }
      }
    }

    hydrate();

    return () => {
      cancelled = true;
    };
  }, [key]);

  useEffect(() => {
    if (!hydrated.current) return;
    setJson(key, value).catch(() => {});
  }, [key, value]);

  async function reset() {
    await removeKey(key);
    setValue(initialValue);
  }

  return { value, setValue, loading, reset };
}
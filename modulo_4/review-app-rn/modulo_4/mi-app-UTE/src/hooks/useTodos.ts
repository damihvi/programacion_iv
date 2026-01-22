import { useFetch } from "./useFetch";
import { getTodos, type TodoDTO } from "../services/todoService";

export function useTodos(limit = 8) {
  return useFetch<TodoDTO[]>(() => getTodos(limit));
}
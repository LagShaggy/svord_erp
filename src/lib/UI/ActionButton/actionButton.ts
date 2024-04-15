import { writable } from 'svelte/store'
import type { ActionType } from './types'

const createStore = () => {
	const { subscribe, set, update } = writable<ActionType[]>([])

	return {
		subscribe,
		set,
		update,
		add: (props: ActionType) => {
			update((n) => [...n, { ...props }])
		},
		reset: () => {
			set([])
		}
	}
}

export const actionStore = createStore()

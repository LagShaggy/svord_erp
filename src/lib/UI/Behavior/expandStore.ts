import { writable } from 'svelte/store'

export const createExpandedControl = (init: boolean) => {
	const { set, subscribe, update } = writable<boolean>(init)

	return {
		subscribe,
		set,
		toggle: () => {
			update((b) => !b)
		}
	}
}

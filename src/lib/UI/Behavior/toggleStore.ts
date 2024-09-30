import { writable } from 'svelte/store'

export const createToggleControl = (init: boolean) => {
	const { set, subscribe, update } = writable<boolean>(init)

	return {
		subscribe,
		set,
		toggle: () => {
			update((b) => !b)
		},
		close: () => {
			set(false)
		},
		open: () => {
			set(true)
		}
	}
}

export type ToggleControlType = ReturnType<typeof createToggleControl>

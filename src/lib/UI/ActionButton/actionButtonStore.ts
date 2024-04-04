import type { ComponentType } from 'svelte'
import { writable } from 'svelte/store'

// type ActionStore = {
// 	id: number
// 	action: ComponentType
// 	props: {
// 		click: () => void
// 	}
// }

const createStore = () => {
	const { subscribe, set, update } = writable<ComponentType[]>([])
	// const id = writable<number>(0)

	return {
		subscribe,
		set,
		update,
		add: (c: ComponentType) => {
			update((n) => [...n, c])
			return 0
		}
	}
}

export const actionStore = createStore()

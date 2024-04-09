import { writable } from 'svelte/store'

const createStore = () => {
	const { subscribe, set, update } = writable<
		{ command: () => void; img: string; className?: string }[]
	>([])

	return {
		subscribe,
		set,
		update,
		add: (props: { command: () => void; img: string; className?: string }) => {
			update((n) => [...n, { ...props }])
		},
		reset: () => {
			set([])
		}
	}
}

export const actionStore = createStore()

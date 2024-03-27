import { writable } from 'svelte/store'

// Time
export const time = writable(new Date(), (set) => {
	const timer = setInterval(() => {
		set(new Date())
	}, 1000)

	return () => {
		clearInterval(timer)
	}
})

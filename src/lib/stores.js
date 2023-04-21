import { writable } from 'svelte/store'

// Auth Stores
// Session
export const session = writable(
	{ loggedIn: false, data: {} },
	(set) => {
		console.log('user store created!')

		return () => {
			console.log('user store deleted!')
			set({ loggedIn: false, data: {} })
		}
	}
)

// Time
export const time = writable(new Date(), (set) => {
	const timer = setInterval(() => {
		set(new Date())
	}, 1000)

	return () => {
		clearInterval(timer)
	}
})

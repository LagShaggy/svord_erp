import { writable } from 'svelte/store'

// Auth Stores
// Session
export const session = writable(
	{ loggedIn: false, data: { user: { email: '' } } },
	(set) => {
		console.log('user store created!')
		return () => {
			console.log('user store deleted!')
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
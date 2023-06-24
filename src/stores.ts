import { writable } from 'svelte/store'

export const alert = writable({
	title: 'Alert:',
	text: 'Context',
	colour: 'yellow'
})

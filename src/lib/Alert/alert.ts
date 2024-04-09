import { writable } from 'svelte/store'

type AlertType = 'INFO' | 'OK' | 'WARNING' | 'ERROR'

export type Alert = {
	title: string
	message: string
	type: AlertType
	interval?: number
}

const createAlertStore = () => {
	const { subscribe, update } = writable<Alert[]>([])

	return {
		subscribe,
		add: (u: Alert) => {
			update((n) => [...n, u])
			setTimeout(function () {
				update((arr) => {
					arr.shift()
					return arr
				})
			}, u.interval ?? 5000)
		}
	}
}

export const alertStore = createAlertStore()

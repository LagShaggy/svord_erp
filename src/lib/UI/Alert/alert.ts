import { writable } from 'svelte/store'
import { v4 as uuidv4 } from 'uuid'

type AlertType = 'INFO' | 'OK' | 'WARNING' | 'ERROR'

export type Alert = {
	title: string
	message: string
	type: AlertType
	interval?: number
}

type IddAlert = Alert & { id: string }

const createAlertStore = () => {
	const { subscribe, update } = writable<IddAlert[]>([])

	const remove = (id: string) => {
		update((l) => l.filter((a) => a.id != id))
	}

	return {
		subscribe,
		remove,
		warning: (title: string, message: string) => {
			const a: Alert = {message, title, type:"WARNING"}
			const id = uuidv4()
			const ida: IddAlert = { id, ...a }
			update((l) => [...l, ida])
			setTimeout(() => {
				remove(id)
			}, a.interval ?? 10000)
		},
		success: (title: string, message: string) => {
			const a: Alert = {message, title, type:"OK"}
			const id = uuidv4()
			const ida: IddAlert = { id, ...a }
			update((l) => [...l, ida])
			setTimeout(() => {
				remove(id)
			}, a.interval ?? 10000)
		},
		error: (title: string, message: string) => {
			const a: Alert = {message, title, type:"ERROR"}
			const id = uuidv4()
			const ida: IddAlert = { id, ...a }
			update((l) => [...l, ida])
			setTimeout(() => {
				remove(id)
			}, a.interval ?? 10000)
		},
		info: (title: string, message: string) => {
			const a: Alert = {message, title, type:"INFO"}
			const id = uuidv4()
			const ida: IddAlert = { id, ...a }
			update((l) => [...l, ida])
			setTimeout(() => {
				remove(id)
			}, a.interval ?? 10000)
		},
		add: (a: Alert | undefined): string | undefined => {
			if (!a) return
			const id = uuidv4()
			const ida: IddAlert = { id, ...a }
			update((l) => [...l, ida])
			setTimeout(() => {
				remove(id)
			}, a.interval ?? 10000)
		}
	}
}

export const alertStore = createAlertStore()

import type { ComponentType } from 'svelte'

export type ActionType = {
	command: () => void
	img: ComponentType
	name?: string
	imgProps?: string
	className?: string
}

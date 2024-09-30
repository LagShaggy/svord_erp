import type { Action } from 'svelte/action'

interface Attributes {
	'on:outside'?: (event: CustomEvent) => void
}

export const clickOutsideAction: Action<HTMLElement, undefined, Attributes> = (
	element: HTMLElement
) => {
	const handleClick = (event: MouseEvent) => {
		const targetEl = event.target as HTMLElement

		if (element && !element.contains(targetEl)) {
			const clickOutsideEvent = new CustomEvent('outside')
			element.dispatchEvent(clickOutsideEvent)
		}
	}
	document.addEventListener('click', handleClick, true)
	return {
		destroy() {
			document.removeEventListener('click', handleClick)
		}
	}
}

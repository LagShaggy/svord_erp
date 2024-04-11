<script lang="ts">
	import type { Action } from 'svelte/action'
	import { slide } from 'svelte/transition'

	export let expanded
	export let displaceCSS: string = ''
	export let className: string = ''

	interface Attributes {
		'on:outside'?: (event: CustomEvent) => void
	}

	const clickOutsideOfParent: Action<HTMLElement, any, Attributes> = (element: HTMLElement) => {
		const handleClick = (event: MouseEvent) => {
			const targetEl = event.target as HTMLElement

			if (element && !element.parentElement?.contains(targetEl)) {
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
</script>

{#if $expanded}
	<div
		transition:slide
		use:clickOutsideOfParent
		on:outside={() => ($expanded = false)}
		class="absolute z-10 {displaceCSS} {className}"
	>
		<slot />
	</div>
{/if}

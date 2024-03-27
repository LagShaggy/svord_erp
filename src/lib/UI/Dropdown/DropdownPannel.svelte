<script lang="ts">
	import { getContext, onMount } from 'svelte'
	import type { Action } from 'svelte/action'
	import { writable, type Writable } from 'svelte/store'
	import { slide } from 'svelte/transition'

	export let expanded: Writable<boolean> = writable(false)
	export let displaceCSS

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

	const closeDropdown = () => {
		$expanded = false
	}
</script>

{#if $expanded}
	<div
		in:slide
		out:slide
		use:clickOutsideOfParent
		on:outside={closeDropdown}
		class="bg-white w-28 absolute {displaceCSS}"
	>
		<slot />
	</div>
{/if}

<script lang="ts">
	import { fly } from 'svelte/transition'
	import { backOut } from 'svelte/easing'
	import { clickOutsideAction } from '../../Behavior/clickOutside'
	import { type ToggleControlType, createToggleControl } from '../../Behavior/toggleStore'
	import { onMount } from 'svelte'

	export let active: ToggleControlType = createToggleControl(false)

	//close with escape
	export const escapeAction = (el: HTMLElement) => {
		const handleKeydown = (keypress: KeyboardEvent) => {
			if (keypress.key !== 'Escape') {
				return
			}
			active.close()
		}
		document.addEventListener('keydown', handleKeydown)

		return {
			destroy: () => document.removeEventListener('keydown', handleKeydown)
		}
	}
</script>

{#if $active}
	<!-- maybe use dialog html component -->
	<div
		transition:fly={{ y: 50, duration: 250, easing: backOut }}
		use:escapeAction
		use:clickOutsideAction
		on:outside={active.close}
		class="fixed top-0 left-0 right-0 bottom-0
			z-10 bg-black bg-opacity-90
			md:px-20 px-3
		"
	>
		<div class="h-full w-full flex flex-col justify-center items-center relative">
			<slot toggleControll={active} />
		</div>
	</div>
{/if}

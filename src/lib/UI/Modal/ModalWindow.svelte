<script lang="ts">
	import { fly } from 'svelte/transition'
	import { clickOutsideAction } from '../Behavior/clickOutside'
	import { createToggleControl, type ToggleControlType } from '../Behavior/toggleStore'
	import { backOut } from 'svelte/easing'
	import X from '$src/lib/Icons/X.svelte'
	import RoundButton from '../Primitive/RoundButton.svelte'

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
	<div class="fixed top-0 left-0 w-screen h-screen bg-opacity-10 bg-black flex justify-center z-10">
		<div class="relative">
			<div
				transition:fly={{ y: 50, duration: 250, easing: backOut }}
				use:escapeAction
				use:clickOutsideAction
				on:outside={active.close}
				class="fixed lg:top-1/2 lg:left-1/2 lg:-translate-y-1/2 -translate-x-1/2
				w-[98%] h-4/5 bottom-24 lg:w-2/3 lg:h-1/2 px-20 h-80%
				bg-white
				border-t border-x lg:border border-secondary-300 rounded-t-md
				"
			>
				<RoundButton
					command={active.close}
					className="absolute -bottom-5 right-1/2 translate-x-1/2"
				>
					<X></X>
				</RoundButton>

				<slot toggleControll={active} />
			</div>
		</div>
	</div>
{/if}

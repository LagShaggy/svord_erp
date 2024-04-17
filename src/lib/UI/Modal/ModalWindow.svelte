<script lang="ts">
	import Add from '$src/lib/Icons/Add.svelte'
	import { createToggleControl } from '../Behavior/toggleStore'

	const active = createToggleControl(true)
</script>

{#if $active}
	<div
		class="fixed top-0 left-0 w-screen h-screen bg-opacity-10 bg-black flex justify-center overscroll-auto"
	>
		<div class="relative">
			<div
				class="fixed top-1/2 left-1/2 -translate-y-1/2 -translate-x-1/2
				border border-primary-colour rounded-md
				bg-primary-colour bg-opacity-20 backdrop-blur-md
				w-11/12 h-2/3 lg:w-2/3 lg:h-1/2 px-20"
			>
				<button on:click={active.close} class="absolute top-5 right-5">
					<Add className="stroke-black"></Add>
				</button>
				<slot />
			</div>
		</div>
	</div>
{/if}

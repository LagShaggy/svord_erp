<script lang="ts">
	import { slide } from 'svelte/transition'
	import { createToggleControl } from '../Behavior/toggleStore'

	interface AccordionProps {
		title: string
		shortDescr?: string
		expanded?: boolean
	}

	export let props: AccordionProps = {
		title: 'Accordion',
		shortDescr: 'Description is missing'
	}

	export let expanded = createToggleControl(props.expanded ?? false)

	const closeChevron = '/icons/chevron-up.svg'
	const openChevron = '/icons/chevron-down.svg'

	let chevron: string = $expanded ? closeChevron : openChevron
	$: chevron = $expanded ? closeChevron : openChevron
</script>

<div class="border-y-2 min-h-20">
	<button type="button" class="flex h-20 w-full items-center" on:click={expanded.toggle}>
		<img src={chevron} alt="" />
		<p class="w-3/4 text-black text-xl">
			{props.title}
		</p>
		<p class="text-gray-500">
			{props.shortDescr}
		</p>
	</button>
	{#if $expanded}
		<div transition:slide={{ delay: 100, duration: 250 }} class="py-4 px-1">
			<slot>
				<section>
					THE ACCORDION IS CURRENTLY EMPTY THE ACCORDION IS CURRENTLY EMPTY THE ACCORDION IS
					CURRENTLY EMPTY THE ACCORDION IS CURRENTLY EMPTY THE ACCORDION IS CURRENTLY EMPTY THE
					ACCORDION IS CURRENTLY EMPTY THE ACCORDION IS CURRENTLY EMPTY THE ACCORDION IS CURRENTLY
					EMPTY THE ACCORDION IS CURRENTLY EMPTY THE ACCORDION IS CURRENTLY EMPTY THE ACCORDION IS
					CURRENTLY EMPTY
				</section>
			</slot>
		</div>
	{/if}
</div>

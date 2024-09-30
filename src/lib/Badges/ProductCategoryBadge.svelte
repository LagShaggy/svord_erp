<script lang="ts">
	import { hexToRGBA } from '../helpers/colour'
	import type { ProductCategoryType } from '../supabase/schema'

	export let category: ProductCategoryType | null

	const borderColour = hexToRGBA(category?.colour_hex ?? null, 0.5)
	const textColour = hexToRGBA(category?.colour_hex ?? null, 0.9)
	const backgroundColour = hexToRGBA(category?.colour_hex ?? null, 0.3)
</script>

{#if category}
	<div
		style:border-color={borderColour}
		style:background-color={backgroundColour}
		class="border-4 rounded-xl max-w-min py-1 px-2"
	>
		<div style:color={textColour} class="flex justify-center items-center">
			{category.name}
		</div>
	</div>
{/if}

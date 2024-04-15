<script lang="ts">
	import type { ProductCategory } from '../supabase/schema'

	export let category: ProductCategory | null
</script>

{#if category}
	<div class="badge-container rounded-sm border-4">
		<p class="badge-text">
			{category.name}
		</p>
	</div>
{/if}

<style>
	.badgeText {
	}

	.badge-container {
	}
</style>

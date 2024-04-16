<script lang="ts">
	import TableData from '../Molecules/TableData.svelte'
	import { getColourForIndex } from '../Molecules/tableHelpers'
	import TableRow from '../Molecules/TableRow.svelte'
	import { goto } from '$app/navigation'
	import type { Product, ProductCategoryType } from '$src/lib/supabase/schema'
	import ProductCategoryBadge from '$src/lib/Badges/ProductCategoryBadge.svelte'

	export let item: Omit<Product, 'category'> & { category: ProductCategoryType }
	export let index: number
	const colour = getColourForIndex(index)
	const handleClick = (e: MouseEvent) => {
		goto(`/products/item/${item.id}`)
	}
</script>

<TableRow {colour} {handleClick}>
	<TableData>
		{item.id}
	</TableData>
	<TableData>
		<ProductCategoryBadge category={item.category} />
	</TableData>
	<TableData>
		<span class="text-base">
			{item.name}
		</span>
	</TableData>
	<TableData>
		{item.description}
	</TableData>
</TableRow>

<script lang="ts">
	import TableHeader from './Molecules/TableHeader.svelte'
	import { getKeys } from './Molecules/tableHelpers'

	export let items: any[] | null
	// const keys = getKeys(items && items[0])
</script>

{#if items != null && items?.length != 0}
	<table class="w-full">
		<tbody class="bg-white divide-y divide-gray-200">
			{#each items ?? [] as item, index (item.id)}
				<slot {item} {index} />
			{/each}
		</tbody>
	</table>
{/if}

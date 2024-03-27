<script lang="ts">
	import BasePage from '$src/lib/UI/BasePage.svelte'
	import type { PageData } from './$types'

	export let data: PageData
	let { product } = data
	$: ({ product } = data)
</script>

<BasePage title={product.name}></BasePage>

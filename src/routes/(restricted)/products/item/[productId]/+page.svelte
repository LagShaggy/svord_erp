<script lang="ts">
	import Accordion from '$src/lib/UI/Accordion/Accordion.svelte'
	import BasePage from '$src/lib/UI/BasePage.svelte'
	import type { PageData } from './$types'

	export let data: PageData
	let { product } = data
	$: ({ product } = data)
</script>

<BasePage title={product.name}>
	<Accordion
		props={{
			title: 'Product Informartion',
			shortDescr: 'Here you can see an overview of the basic product properties'
		}}
	></Accordion>
	<Accordion props={{ title: 'Workflows', shortDescr: 'See product workflows' }}></Accordion>
	<Accordion props={{ title: 'People of Interest', shortDescr: 'See product workflows' }}
	></Accordion>
	<Accordion props={{ title: 'Comments', shortDescr: 'See product workflows' }}></Accordion>
</BasePage>

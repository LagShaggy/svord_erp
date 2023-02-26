<script>
	import Description from '$lib/Items/Description.svelte'
	/** @type {import('./$types').PageData} */
	export let data
	let { item } = data
	$: ({ item } = data)
</script>

<h1>ITEM:</h1>
<h2>{item.name}</h2>
<h2>Quantity: {item.quantity}</h2>
<Description description={item.description} />

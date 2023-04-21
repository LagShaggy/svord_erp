<script>
	import { goto } from '$app/navigation'
	import { onDestroy, onMount } from 'svelte'
	import { session } from '$lib/stores'

	let pass = false

	const redirect = () => {
		goto('/auth/login')
	}
	onMount(() => {})

	onDestroy(() => {
		unsubscribe()
	})
</script>

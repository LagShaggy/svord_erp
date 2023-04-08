<script>
	import Login from '$lib/Auth/Login.svelte'
	import Register from '$lib/Auth/Register.svelte'

	import { onMount } from 'svelte'
	export let data
	let { users } = data
	$: ({ users } = data)
</script>

<Login />

<Register />

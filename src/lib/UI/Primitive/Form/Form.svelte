<script lang="ts">
	import { enhance } from '$app/forms'
	import { setContext } from 'svelte'
	import { writable } from 'svelte/store'

	export let action: string = ''
	export let className: string = ''
	const submitable = writable<boolean[]>([])

	setContext('sumbit', submitable)
</script>

<form
	method="POST"
	{action}
	{...$$props}
	class="flex justify-center h-full flex-col flex-grow gap-2 mx-auto {className}"
	on:change
	use:enhance
>
	<slot />
</form>

<script lang="ts">
	import { goto } from '$app/navigation'
	import Logout from '$lib/Auth/Logout.svelte'
	import { slide } from 'svelte/transition'

	let expanded: boolean = false
	const handleExpand = () => {
		expanded = !expanded
	}

	const redirect = (path: string) => {
		expanded = false
		goto(path)
	}
</script>

<div class="fixed top-3 right-3">
	<div class="flex flex-col items-end">
		<button
			class="w-10 h-10 rounded-full border-1 bg-cyan-200 overflow-hidden"
			on:click={handleExpand}
		>
			<img src="/icons/user.svg" alt="Profile picutre" class="w-full h-full object-cover" />
		</button>
		{#if expanded}
			<div in:slide out:slide class="bg-white w-3/5">
				<button on:click={() => redirect('/account')}>Profile</button>
				<div>Some Option 2</div>
				<Logout />
			</div>
		{/if}
	</div>
</div>

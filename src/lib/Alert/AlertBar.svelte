<script lang="ts">
	import { fly } from 'svelte/transition'
	import { alertStore } from './alert'
	import Alert from './Alert.svelte'
</script>

<span class="fixed top-2 z-20 left-1/2 -translate-x-1/2">
	<div transition:fly={{ duration: 500, y: -50 }} class="flex flex-col gap-1">
		{#each $alertStore as { id, ...alert } (id)}
			<div transition:fly={{ duration: 500, y: -50 }} class="w-full">
				<Alert {alert} destroy={() => alertStore.remove(id)} />
			</div>
		{/each}
	</div>
</span>

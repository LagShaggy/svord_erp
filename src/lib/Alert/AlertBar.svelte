<script>
	import { fade } from 'svelte/transition'
	import Alert from './Alert.svelte'
	import { alertStore } from './alert'
</script>

<span class="fixed top-2 left-1/2 z-20 -translate-x-1/2">
	{#if $alertStore.length !== 0}
		<div transition:fade class="flex flex-col gap-1">
			{#each $alertStore as alert}
				<div transition:fade>
					<Alert {alert} />
				</div>
			{/each}
		</div>
	{/if}
</span>

<script lang="ts">
	import { session } from '$src/lib/stores'
	//head
	let title = 'Overview'
</script>

<svelte:head>
	<title>{title}</title>
</svelte:head>

<header>
	<h1>{title}</h1>
</header>

<body>
	<h2 class="center">THIS IS THE MAIN PAGE</h2>
</body>

{JSON.stringify($session.data)}

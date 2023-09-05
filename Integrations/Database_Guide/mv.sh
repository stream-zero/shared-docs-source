for f in *.mdx; do 
    mv -- "$f" "${f%.mdx}.md"
done


package practice.LRUCache;

import static org.junit.Assert.*;

import java.util.Arrays;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;
import static com.greghaskins.spectrum.dsl.specification.Specification.*;

@RunWith(Spectrum.class)
public class LRUCacheTest {{
	describe(".put", () -> {
		describe("When we add less items than the limit", () -> {
			it("contains all items", () -> {
				int[] expectedOrder = new int[] { 1, 2, 3 };
				
				LRUCache cache = new LRUCache(5);

				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				int[] result = cache.getItems();
				
				assertEquals(Arrays.toString(expectedOrder), Arrays.toString(result));
			});
		});
		
		describe("When we add more items than the limit", () -> {
			it("contains only the last added items", () -> {
				int[] expectedOrder = new int[] { 1, 2 };
				
				LRUCache cache = new LRUCache(2);

				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				int[] result = cache.getItems();
				
				assertEquals(Arrays.toString(expectedOrder), Arrays.toString(result));
				assertEquals(null, cache.get("Key for 3"));
			});
		});
	});
		
	describe(".get", () -> {
		describe("When we get an item from the middle", () -> {
			it("makes the requested item the most recently used", () -> {
				int[] expectedOrder = new int[] { 2, 1, 3 };
				
				LRUCache cache = new LRUCache(3);
	
				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				int gotItem = (int)cache.get("Key for 2");
				
				assertEquals(2, gotItem);
				
				assertEquals(null, cache.get("not existing key"));
				
				int[] result = cache.getItems();
				
				assertEquals(Arrays.toString(expectedOrder), Arrays.toString(result));
			});
		});
		
		describe("When we get an item from the end", () -> {
			it("makes the requested item the most recently used", () -> {
				int[] expectedOrder = new int[] { 3, 1, 2 };
				
				LRUCache cache = new LRUCache(3);
	
				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				int gotItem = (int)cache.get("Key for 3");
				
				assertEquals(3, gotItem);
				
				int[] result = cache.getItems();
				
				assertEquals(Arrays.toString(expectedOrder), Arrays.toString(result));
			});
		});
		
		describe("When we get an item from the begining", () -> {
			it("makes the requested item the most recently used", () -> {
				int[] expectedOrder = new int[] { 1, 2, 3 };
				
				LRUCache cache = new LRUCache(3);
	
				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				int gotItem = (int)cache.get("Key for 1");
				
				assertEquals(1, gotItem);
				
				int[] result = cache.getItems();
				
				assertEquals(Arrays.toString(expectedOrder), Arrays.toString(result));
			});
		});
	});
}}
